(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v7 ?v8)
             (pred_4 ?v6 ?v5)
             (pred_8 ?v7 ?v5)
             (pred_5 ?v4 ?v7 )
	     (pred_7 ?v7)
             (pred_2 ?v3)
             (pred_3 ?v6)
             (pred_6 ?v5)
             (pred_9 ?v7)
             (pred_10 ?v6)
             (pred_12 ?v7)
             (pred_11 ))



(:action op_3
:parameters (?v13 ?v10 ?v11 ?v2)
:precondition (and (pred_2 ?v13) (pred_2 ?v10) (pred_3 ?v11) (pred_6 ?v2)
          (pred_1 ?v13 ?v10) (pred_4 ?v11 ?v2)
                   (pred_8 ?v10 ?v2) (pred_7 ?v13) 
                   (pred_9 ?v10) (pred_10 ?v11))
:effect (and  (pred_12 ?v10) (not (pred_9 ?v10))))


(:action op_1
:parameters (?v13 ?v12)
:precondition (and (pred_2 ?v13) (pred_2 ?v12)
               (pred_7 ?v13) (pred_1 ?v13 ?v12) (pred_12 ?v12))
:effect (and (pred_7 ?v12) (not (pred_7 ?v13))))

(:action op_2
:parameters (?v13 ?v11)
:precondition (and (pred_2 ?v13) (pred_3 ?v11) 
                  (pred_7 ?v13) (pred_5 ?v11 ?v13) (pred_11 ))
:effect (and (pred_10 ?v11)
   (not (pred_5 ?v11 ?v13)) (not (pred_11 ))))


(:action op_4
:parameters (?v13 ?v1 ?v9)
:precondition (and (pred_2 ?v13) (pred_3 ?v1) (pred_3 ?v9)
                  (pred_7 ?v13) (pred_10 ?v9) (pred_5 ?v1 ?v13))
:effect (and (pred_10 ?v1) (pred_5 ?v9 ?v13)
        (not (pred_10 ?v9)) (not (pred_5 ?v1 ?v13))))

(:action op_5
:parameters (?v13 ?v11)
:precondition (and (pred_2 ?v13) (pred_3 ?v11) 
                  (pred_7 ?v13) (pred_10 ?v11))
:effect (and (pred_11 ) (pred_5 ?v11 ?v13) (not (pred_10 ?v11)))))


	
