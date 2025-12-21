(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v6 ?v4)
             (pred_8 ?v10 ?v3)
             (pred_10 ?v6 ?v3)
             (pred_1 ?v2 ?v6 )
	     (pred_6 ?v6)
             (pred_2 ?v8)
             (pred_5 ?v10)
             (pred_3 ?v3)
             (pred_12 ?v6)
             (pred_7 ?v10)
             (pred_4 ?v6)
             (pred_11 ))



(:action op_4
:parameters (?v13 ?v12 ?v1 ?v9)
:precondition (and (pred_2 ?v13) (pred_2 ?v12) (pred_5 ?v1) (pred_3 ?v9)
          (pred_9 ?v13 ?v12) (pred_8 ?v1 ?v9)
                   (pred_10 ?v12 ?v9) (pred_6 ?v13) 
                   (pred_12 ?v12) (pred_7 ?v1))
:effect (and  (pred_4 ?v12) (not (pred_12 ?v12))))


(:action op_2
:parameters (?v13 ?v11)
:precondition (and (pred_2 ?v13) (pred_2 ?v11)
               (pred_6 ?v13) (pred_9 ?v13 ?v11) (pred_4 ?v11))
:effect (and (pred_6 ?v11) (not (pred_6 ?v13))))

(:action op_1
:parameters (?v13 ?v1)
:precondition (and (pred_2 ?v13) (pred_5 ?v1) 
                  (pred_6 ?v13) (pred_1 ?v1 ?v13) (pred_11 ))
:effect (and (pred_7 ?v1)
   (not (pred_1 ?v1 ?v13)) (not (pred_11 ))))


(:action op_3
:parameters (?v13 ?v5 ?v7)
:precondition (and (pred_2 ?v13) (pred_5 ?v5) (pred_5 ?v7)
                  (pred_6 ?v13) (pred_7 ?v7) (pred_1 ?v5 ?v13))
:effect (and (pred_7 ?v5) (pred_1 ?v7 ?v13)
        (not (pred_7 ?v7)) (not (pred_1 ?v5 ?v13))))

(:action op_5
:parameters (?v13 ?v1)
:precondition (and (pred_2 ?v13) (pred_5 ?v1) 
                  (pred_6 ?v13) (pred_7 ?v1))
:effect (and (pred_11 ) (pred_1 ?v1 ?v13) (not (pred_7 ?v1)))))


	
