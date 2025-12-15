(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v4 ?v5)
             (pred_12 ?v7 ?v10)
             (pred_2 ?v4 ?v10)
             (pred_1 ?v3 ?v4 )
	     (pred_9 ?v4)
             (pred_5 ?v2)
             (pred_11 ?v7)
             (pred_4 ?v10)
             (pred_3 ?v4)
             (pred_8 ?v7)
             (pred_6 ?v4)
             (pred_10 ))



(:action op_2
:parameters (?v13 ?v6 ?v8 ?v12)
:precondition (and (pred_5 ?v13) (pred_5 ?v6) (pred_11 ?v8) (pred_4 ?v12)
          (pred_7 ?v13 ?v6) (pred_12 ?v8 ?v12)
                   (pred_2 ?v6 ?v12) (pred_9 ?v13) 
                   (pred_3 ?v6) (pred_8 ?v8))
:effect (and  (pred_6 ?v6) (not (pred_3 ?v6))))


(:action op_4
:parameters (?v13 ?v11)
:precondition (and (pred_5 ?v13) (pred_5 ?v11)
               (pred_9 ?v13) (pred_7 ?v13 ?v11) (pred_6 ?v11))
:effect (and (pred_9 ?v11) (not (pred_9 ?v13))))

(:action op_5
:parameters (?v13 ?v8)
:precondition (and (pred_5 ?v13) (pred_11 ?v8) 
                  (pred_9 ?v13) (pred_1 ?v8 ?v13) (pred_10 ))
:effect (and (pred_8 ?v8)
   (not (pred_1 ?v8 ?v13)) (not (pred_10 ))))


(:action op_1
:parameters (?v13 ?v1 ?v9)
:precondition (and (pred_5 ?v13) (pred_11 ?v1) (pred_11 ?v9)
                  (pred_9 ?v13) (pred_8 ?v9) (pred_1 ?v1 ?v13))
:effect (and (pred_8 ?v1) (pred_1 ?v9 ?v13)
        (not (pred_8 ?v9)) (not (pred_1 ?v1 ?v13))))

(:action op_3
:parameters (?v13 ?v8)
:precondition (and (pred_5 ?v13) (pred_11 ?v8) 
                  (pred_9 ?v13) (pred_8 ?v8))
:effect (and (pred_10 ) (pred_1 ?v8 ?v13) (not (pred_8 ?v8)))))


	
