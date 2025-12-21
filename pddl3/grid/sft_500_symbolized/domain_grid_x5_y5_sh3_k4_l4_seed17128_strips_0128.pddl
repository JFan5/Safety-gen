(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v8 ?v7)
             (pred_3 ?v13 ?v10)
             (pred_11 ?v8 ?v10)
             (pred_2 ?v12 ?v8 )
	     (pred_1 ?v8)
             (pred_4 ?v9)
             (pred_8 ?v13)
             (pred_12 ?v10)
             (pred_10 ?v8)
             (pred_9 ?v13)
             (pred_6 ?v8)
             (pred_5 ))



(:action op_3
:parameters (?v5 ?v6 ?v4 ?v11)
:precondition (and (pred_4 ?v5) (pred_4 ?v6) (pred_8 ?v4) (pred_12 ?v11)
          (pred_7 ?v5 ?v6) (pred_3 ?v4 ?v11)
                   (pred_11 ?v6 ?v11) (pred_1 ?v5) 
                   (pred_10 ?v6) (pred_9 ?v4))
:effect (and  (pred_6 ?v6) (not (pred_10 ?v6))))


(:action op_4
:parameters (?v5 ?v1)
:precondition (and (pred_4 ?v5) (pred_4 ?v1)
               (pred_1 ?v5) (pred_7 ?v5 ?v1) (pred_6 ?v1))
:effect (and (pred_1 ?v1) (not (pred_1 ?v5))))

(:action op_2
:parameters (?v5 ?v4)
:precondition (and (pred_4 ?v5) (pred_8 ?v4) 
                  (pred_1 ?v5) (pred_2 ?v4 ?v5) (pred_5 ))
:effect (and (pred_9 ?v4)
   (not (pred_2 ?v4 ?v5)) (not (pred_5 ))))


(:action op_5
:parameters (?v5 ?v3 ?v2)
:precondition (and (pred_4 ?v5) (pred_8 ?v3) (pred_8 ?v2)
                  (pred_1 ?v5) (pred_9 ?v2) (pred_2 ?v3 ?v5))
:effect (and (pred_9 ?v3) (pred_2 ?v2 ?v5)
        (not (pred_9 ?v2)) (not (pred_2 ?v3 ?v5))))

(:action op_1
:parameters (?v5 ?v4)
:precondition (and (pred_4 ?v5) (pred_8 ?v4) 
                  (pred_1 ?v5) (pred_9 ?v4))
:effect (and (pred_5 ) (pred_2 ?v4 ?v5) (not (pred_9 ?v4)))))


	
