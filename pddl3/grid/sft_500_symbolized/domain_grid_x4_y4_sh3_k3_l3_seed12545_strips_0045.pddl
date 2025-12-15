(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v1 ?v7)
             (pred_8 ?v5 ?v12)
             (pred_4 ?v1 ?v12)
             (pred_6 ?v9 ?v1 )
	     (pred_3 ?v1)
             (pred_2 ?v8)
             (pred_12 ?v5)
             (pred_10 ?v12)
             (pred_11 ?v1)
             (pred_9 ?v5)
             (pred_7 ?v1)
             (pred_5 ))



(:action op_4
:parameters (?v13 ?v4 ?v6 ?v2)
:precondition (and (pred_2 ?v13) (pred_2 ?v4) (pred_12 ?v6) (pred_10 ?v2)
          (pred_1 ?v13 ?v4) (pred_8 ?v6 ?v2)
                   (pred_4 ?v4 ?v2) (pred_3 ?v13) 
                   (pred_11 ?v4) (pred_9 ?v6))
:effect (and  (pred_7 ?v4) (not (pred_11 ?v4))))


(:action op_2
:parameters (?v13 ?v10)
:precondition (and (pred_2 ?v13) (pred_2 ?v10)
               (pred_3 ?v13) (pred_1 ?v13 ?v10) (pred_7 ?v10))
:effect (and (pred_3 ?v10) (not (pred_3 ?v13))))

(:action op_3
:parameters (?v13 ?v6)
:precondition (and (pred_2 ?v13) (pred_12 ?v6) 
                  (pred_3 ?v13) (pred_6 ?v6 ?v13) (pred_5 ))
:effect (and (pred_9 ?v6)
   (not (pred_6 ?v6 ?v13)) (not (pred_5 ))))


(:action op_1
:parameters (?v13 ?v3 ?v11)
:precondition (and (pred_2 ?v13) (pred_12 ?v3) (pred_12 ?v11)
                  (pred_3 ?v13) (pred_9 ?v11) (pred_6 ?v3 ?v13))
:effect (and (pred_9 ?v3) (pred_6 ?v11 ?v13)
        (not (pred_9 ?v11)) (not (pred_6 ?v3 ?v13))))

(:action op_5
:parameters (?v13 ?v6)
:precondition (and (pred_2 ?v13) (pred_12 ?v6) 
                  (pred_3 ?v13) (pred_9 ?v6))
:effect (and (pred_5 ) (pred_6 ?v6 ?v13) (not (pred_9 ?v6)))))


	
