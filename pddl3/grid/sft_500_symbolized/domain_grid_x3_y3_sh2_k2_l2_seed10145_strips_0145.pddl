(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v5 ?v1)
             (pred_1 ?v10 ?v12)
             (pred_2 ?v5 ?v12)
             (pred_5 ?v7 ?v5 )
	     (pred_8 ?v5)
             (pred_12 ?v9)
             (pred_11 ?v10)
             (pred_7 ?v12)
             (pred_10 ?v5)
             (pred_4 ?v10)
             (pred_6 ?v5)
             (pred_3 ))



(:action op_5
:parameters (?v13 ?v4 ?v2 ?v3)
:precondition (and (pred_12 ?v13) (pred_12 ?v4) (pred_11 ?v2) (pred_7 ?v3)
          (pred_9 ?v13 ?v4) (pred_1 ?v2 ?v3)
                   (pred_2 ?v4 ?v3) (pred_8 ?v13) 
                   (pred_10 ?v4) (pred_4 ?v2))
:effect (and  (pred_6 ?v4) (not (pred_10 ?v4))))


(:action op_1
:parameters (?v13 ?v8)
:precondition (and (pred_12 ?v13) (pred_12 ?v8)
               (pred_8 ?v13) (pred_9 ?v13 ?v8) (pred_6 ?v8))
:effect (and (pred_8 ?v8) (not (pred_8 ?v13))))

(:action op_3
:parameters (?v13 ?v2)
:precondition (and (pred_12 ?v13) (pred_11 ?v2) 
                  (pred_8 ?v13) (pred_5 ?v2 ?v13) (pred_3 ))
:effect (and (pred_4 ?v2)
   (not (pred_5 ?v2 ?v13)) (not (pred_3 ))))


(:action op_4
:parameters (?v13 ?v6 ?v11)
:precondition (and (pred_12 ?v13) (pred_11 ?v6) (pred_11 ?v11)
                  (pred_8 ?v13) (pred_4 ?v11) (pred_5 ?v6 ?v13))
:effect (and (pred_4 ?v6) (pred_5 ?v11 ?v13)
        (not (pred_4 ?v11)) (not (pred_5 ?v6 ?v13))))

(:action op_2
:parameters (?v13 ?v2)
:precondition (and (pred_12 ?v13) (pred_11 ?v2) 
                  (pred_8 ?v13) (pred_4 ?v2))
:effect (and (pred_3 ) (pred_5 ?v2 ?v13) (not (pred_4 ?v2)))))


	
