(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v12 ?v6)
             (pred_1 ?v2 ?v7)
             (pred_10 ?v12 ?v7)
             (pred_7 ?v4 ?v12 )
	     (pred_4 ?v12)
             (pred_9 ?v10)
             (pred_2 ?v2)
             (pred_6 ?v7)
             (pred_11 ?v12)
             (pred_12 ?v2)
             (pred_5 ?v12)
             (pred_3 ))



(:action op_5
:parameters (?v5 ?v13 ?v11 ?v1)
:precondition (and (pred_9 ?v5) (pred_9 ?v13) (pred_2 ?v11) (pred_6 ?v1)
          (pred_8 ?v5 ?v13) (pred_1 ?v11 ?v1)
                   (pred_10 ?v13 ?v1) (pred_4 ?v5) 
                   (pred_11 ?v13) (pred_12 ?v11))
:effect (and  (pred_5 ?v13) (not (pred_11 ?v13))))


(:action op_2
:parameters (?v5 ?v9)
:precondition (and (pred_9 ?v5) (pred_9 ?v9)
               (pred_4 ?v5) (pred_8 ?v5 ?v9) (pred_5 ?v9))
:effect (and (pred_4 ?v9) (not (pred_4 ?v5))))

(:action op_1
:parameters (?v5 ?v11)
:precondition (and (pred_9 ?v5) (pred_2 ?v11) 
                  (pred_4 ?v5) (pred_7 ?v11 ?v5) (pred_3 ))
:effect (and (pred_12 ?v11)
   (not (pred_7 ?v11 ?v5)) (not (pred_3 ))))


(:action op_3
:parameters (?v5 ?v8 ?v3)
:precondition (and (pred_9 ?v5) (pred_2 ?v8) (pred_2 ?v3)
                  (pred_4 ?v5) (pred_12 ?v3) (pred_7 ?v8 ?v5))
:effect (and (pred_12 ?v8) (pred_7 ?v3 ?v5)
        (not (pred_12 ?v3)) (not (pred_7 ?v8 ?v5))))

(:action op_4
:parameters (?v5 ?v11)
:precondition (and (pred_9 ?v5) (pred_2 ?v11) 
                  (pred_4 ?v5) (pred_12 ?v11))
:effect (and (pred_3 ) (pred_7 ?v11 ?v5) (not (pred_12 ?v11)))))


	
