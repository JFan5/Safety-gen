(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v8 ?v12)
             (pred_8 ?v9 ?v4)
             (pred_6 ?v8 ?v4)
             (pred_9 ?v6 ?v8 )
	     (pred_11 ?v8)
             (pred_4 ?v7)
             (pred_1 ?v9)
             (pred_2 ?v4)
             (pred_10 ?v8)
             (pred_5 ?v9)
             (pred_12 ?v8)
             (pred_7 ))



(:action op_5
:parameters (?v13 ?v3 ?v11 ?v2)
:precondition (and (pred_4 ?v13) (pred_4 ?v3) (pred_1 ?v11) (pred_2 ?v2)
          (pred_3 ?v13 ?v3) (pred_8 ?v11 ?v2)
                   (pred_6 ?v3 ?v2) (pred_11 ?v13) 
                   (pred_10 ?v3) (pred_5 ?v11))
:effect (and  (pred_12 ?v3) (not (pred_10 ?v3))))


(:action op_1
:parameters (?v13 ?v5)
:precondition (and (pred_4 ?v13) (pred_4 ?v5)
               (pred_11 ?v13) (pred_3 ?v13 ?v5) (pred_12 ?v5))
:effect (and (pred_11 ?v5) (not (pred_11 ?v13))))

(:action op_4
:parameters (?v13 ?v11)
:precondition (and (pred_4 ?v13) (pred_1 ?v11) 
                  (pred_11 ?v13) (pred_9 ?v11 ?v13) (pred_7 ))
:effect (and (pred_5 ?v11)
   (not (pred_9 ?v11 ?v13)) (not (pred_7 ))))


(:action op_3
:parameters (?v13 ?v10 ?v1)
:precondition (and (pred_4 ?v13) (pred_1 ?v10) (pred_1 ?v1)
                  (pred_11 ?v13) (pred_5 ?v1) (pred_9 ?v10 ?v13))
:effect (and (pred_5 ?v10) (pred_9 ?v1 ?v13)
        (not (pred_5 ?v1)) (not (pred_9 ?v10 ?v13))))

(:action op_2
:parameters (?v13 ?v11)
:precondition (and (pred_4 ?v13) (pred_1 ?v11) 
                  (pred_11 ?v13) (pred_5 ?v11))
:effect (and (pred_7 ) (pred_9 ?v11 ?v13) (not (pred_5 ?v11)))))


	
