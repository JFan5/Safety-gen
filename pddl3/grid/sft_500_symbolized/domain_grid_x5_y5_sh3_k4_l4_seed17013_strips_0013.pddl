(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v7 ?v6)
             (pred_6 ?v4 ?v12)
             (pred_5 ?v7 ?v12)
             (pred_4 ?v2 ?v7 )
	     (pred_12 ?v7)
             (pred_9 ?v10)
             (pred_2 ?v4)
             (pred_7 ?v12)
             (pred_3 ?v7)
             (pred_10 ?v4)
             (pred_8 ?v7)
             (pred_1 ))



(:action op_1
:parameters (?v13 ?v5 ?v8 ?v9)
:precondition (and (pred_9 ?v13) (pred_9 ?v5) (pred_2 ?v8) (pred_7 ?v9)
          (pred_11 ?v13 ?v5) (pred_6 ?v8 ?v9)
                   (pred_5 ?v5 ?v9) (pred_12 ?v13) 
                   (pred_3 ?v5) (pred_10 ?v8))
:effect (and  (pred_8 ?v5) (not (pred_3 ?v5))))


(:action op_4
:parameters (?v13 ?v1)
:precondition (and (pred_9 ?v13) (pred_9 ?v1)
               (pred_12 ?v13) (pred_11 ?v13 ?v1) (pred_8 ?v1))
:effect (and (pred_12 ?v1) (not (pred_12 ?v13))))

(:action op_5
:parameters (?v13 ?v8)
:precondition (and (pred_9 ?v13) (pred_2 ?v8) 
                  (pred_12 ?v13) (pred_4 ?v8 ?v13) (pred_1 ))
:effect (and (pred_10 ?v8)
   (not (pred_4 ?v8 ?v13)) (not (pred_1 ))))


(:action op_3
:parameters (?v13 ?v3 ?v11)
:precondition (and (pred_9 ?v13) (pred_2 ?v3) (pred_2 ?v11)
                  (pred_12 ?v13) (pred_10 ?v11) (pred_4 ?v3 ?v13))
:effect (and (pred_10 ?v3) (pred_4 ?v11 ?v13)
        (not (pred_10 ?v11)) (not (pred_4 ?v3 ?v13))))

(:action op_2
:parameters (?v13 ?v8)
:precondition (and (pred_9 ?v13) (pred_2 ?v8) 
                  (pred_12 ?v13) (pred_10 ?v8))
:effect (and (pred_1 ) (pred_4 ?v8 ?v13) (not (pred_10 ?v8)))))


	
