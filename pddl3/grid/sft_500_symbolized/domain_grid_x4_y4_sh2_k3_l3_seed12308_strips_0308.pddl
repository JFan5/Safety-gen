(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v9 ?v10)
             (pred_12 ?v8 ?v7)
             (pred_5 ?v9 ?v7)
             (pred_6 ?v6 ?v9 )
	     (pred_2 ?v9)
             (pred_7 ?v5)
             (pred_1 ?v8)
             (pred_8 ?v7)
             (pred_9 ?v9)
             (pred_4 ?v8)
             (pred_11 ?v9)
             (pred_10 ))



(:action op_5
:parameters (?v13 ?v12 ?v4 ?v3)
:precondition (and (pred_7 ?v13) (pred_7 ?v12) (pred_1 ?v4) (pred_8 ?v3)
          (pred_3 ?v13 ?v12) (pred_12 ?v4 ?v3)
                   (pred_5 ?v12 ?v3) (pred_2 ?v13) 
                   (pred_9 ?v12) (pred_4 ?v4))
:effect (and  (pred_11 ?v12) (not (pred_9 ?v12))))


(:action op_3
:parameters (?v13 ?v1)
:precondition (and (pred_7 ?v13) (pred_7 ?v1)
               (pred_2 ?v13) (pred_3 ?v13 ?v1) (pred_11 ?v1))
:effect (and (pred_2 ?v1) (not (pred_2 ?v13))))

(:action op_2
:parameters (?v13 ?v4)
:precondition (and (pred_7 ?v13) (pred_1 ?v4) 
                  (pred_2 ?v13) (pred_6 ?v4 ?v13) (pred_10 ))
:effect (and (pred_4 ?v4)
   (not (pred_6 ?v4 ?v13)) (not (pred_10 ))))


(:action op_1
:parameters (?v13 ?v11 ?v2)
:precondition (and (pred_7 ?v13) (pred_1 ?v11) (pred_1 ?v2)
                  (pred_2 ?v13) (pred_4 ?v2) (pred_6 ?v11 ?v13))
:effect (and (pred_4 ?v11) (pred_6 ?v2 ?v13)
        (not (pred_4 ?v2)) (not (pred_6 ?v11 ?v13))))

(:action op_4
:parameters (?v13 ?v4)
:precondition (and (pred_7 ?v13) (pred_1 ?v4) 
                  (pred_2 ?v13) (pred_4 ?v4))
:effect (and (pred_10 ) (pred_6 ?v4 ?v13) (not (pred_4 ?v4)))))


	
