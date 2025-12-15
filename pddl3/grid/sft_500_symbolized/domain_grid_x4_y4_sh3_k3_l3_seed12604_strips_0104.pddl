(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v5 ?v10)
             (pred_1 ?v9 ?v11)
             (pred_8 ?v5 ?v11)
             (pred_10 ?v4 ?v5 )
	     (pred_12 ?v5)
             (pred_7 ?v12)
             (pred_5 ?v9)
             (pred_3 ?v11)
             (pred_2 ?v5)
             (pred_9 ?v9)
             (pred_6 ?v5)
             (pred_11 ))



(:action op_1
:parameters (?v3 ?v6 ?v2 ?v7)
:precondition (and (pred_7 ?v3) (pred_7 ?v6) (pred_5 ?v2) (pred_3 ?v7)
          (pred_4 ?v3 ?v6) (pred_1 ?v2 ?v7)
                   (pred_8 ?v6 ?v7) (pred_12 ?v3) 
                   (pred_2 ?v6) (pred_9 ?v2))
:effect (and  (pred_6 ?v6) (not (pred_2 ?v6))))


(:action op_3
:parameters (?v3 ?v1)
:precondition (and (pred_7 ?v3) (pred_7 ?v1)
               (pred_12 ?v3) (pred_4 ?v3 ?v1) (pred_6 ?v1))
:effect (and (pred_12 ?v1) (not (pred_12 ?v3))))

(:action op_2
:parameters (?v3 ?v2)
:precondition (and (pred_7 ?v3) (pred_5 ?v2) 
                  (pred_12 ?v3) (pred_10 ?v2 ?v3) (pred_11 ))
:effect (and (pred_9 ?v2)
   (not (pred_10 ?v2 ?v3)) (not (pred_11 ))))


(:action op_5
:parameters (?v3 ?v13 ?v8)
:precondition (and (pred_7 ?v3) (pred_5 ?v13) (pred_5 ?v8)
                  (pred_12 ?v3) (pred_9 ?v8) (pred_10 ?v13 ?v3))
:effect (and (pred_9 ?v13) (pred_10 ?v8 ?v3)
        (not (pred_9 ?v8)) (not (pred_10 ?v13 ?v3))))

(:action op_4
:parameters (?v3 ?v2)
:precondition (and (pred_7 ?v3) (pred_5 ?v2) 
                  (pred_12 ?v3) (pred_9 ?v2))
:effect (and (pred_11 ) (pred_10 ?v2 ?v3) (not (pred_9 ?v2)))))


	
