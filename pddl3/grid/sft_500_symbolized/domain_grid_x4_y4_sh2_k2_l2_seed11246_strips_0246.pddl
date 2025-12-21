(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v2 ?v1)
             (pred_1 ?v9 ?v11)
             (pred_3 ?v2 ?v11)
             (pred_9 ?v7 ?v2 )
	     (pred_10 ?v2)
             (pred_2 ?v10)
             (pred_8 ?v9)
             (pred_12 ?v11)
             (pred_4 ?v2)
             (pred_7 ?v9)
             (pred_11 ?v2)
             (pred_5 ))



(:action op_4
:parameters (?v13 ?v4 ?v8 ?v5)
:precondition (and (pred_2 ?v13) (pred_2 ?v4) (pred_8 ?v8) (pred_12 ?v5)
          (pred_6 ?v13 ?v4) (pred_1 ?v8 ?v5)
                   (pred_3 ?v4 ?v5) (pred_10 ?v13) 
                   (pred_4 ?v4) (pred_7 ?v8))
:effect (and  (pred_11 ?v4) (not (pred_4 ?v4))))


(:action op_1
:parameters (?v13 ?v3)
:precondition (and (pred_2 ?v13) (pred_2 ?v3)
               (pred_10 ?v13) (pred_6 ?v13 ?v3) (pred_11 ?v3))
:effect (and (pred_10 ?v3) (not (pred_10 ?v13))))

(:action op_3
:parameters (?v13 ?v8)
:precondition (and (pred_2 ?v13) (pred_8 ?v8) 
                  (pred_10 ?v13) (pred_9 ?v8 ?v13) (pred_5 ))
:effect (and (pred_7 ?v8)
   (not (pred_9 ?v8 ?v13)) (not (pred_5 ))))


(:action op_5
:parameters (?v13 ?v12 ?v6)
:precondition (and (pred_2 ?v13) (pred_8 ?v12) (pred_8 ?v6)
                  (pred_10 ?v13) (pred_7 ?v6) (pred_9 ?v12 ?v13))
:effect (and (pred_7 ?v12) (pred_9 ?v6 ?v13)
        (not (pred_7 ?v6)) (not (pred_9 ?v12 ?v13))))

(:action op_2
:parameters (?v13 ?v8)
:precondition (and (pred_2 ?v13) (pred_8 ?v8) 
                  (pred_10 ?v13) (pred_7 ?v8))
:effect (and (pred_5 ) (pred_9 ?v8 ?v13) (not (pred_7 ?v8)))))


	
