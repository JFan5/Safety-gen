(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v10 ?v13)
             (pred_5 ?v11 ?v2)
             (pred_6 ?v10 ?v2)
             (pred_3 ?v4 ?v10 )
	     (pred_1 ?v10)
             (pred_8 ?v9)
             (pred_4 ?v11)
             (pred_2 ?v2)
             (pred_12 ?v10)
             (pred_10 ?v11)
             (pred_11 ?v10)
             (pred_9 ))



(:action op_1
:parameters (?v3 ?v6 ?v5 ?v7)
:precondition (and (pred_8 ?v3) (pred_8 ?v6) (pred_4 ?v5) (pred_2 ?v7)
          (pred_7 ?v3 ?v6) (pred_5 ?v5 ?v7)
                   (pred_6 ?v6 ?v7) (pred_1 ?v3) 
                   (pred_12 ?v6) (pred_10 ?v5))
:effect (and  (pred_11 ?v6) (not (pred_12 ?v6))))


(:action op_5
:parameters (?v3 ?v12)
:precondition (and (pred_8 ?v3) (pred_8 ?v12)
               (pred_1 ?v3) (pred_7 ?v3 ?v12) (pred_11 ?v12))
:effect (and (pred_1 ?v12) (not (pred_1 ?v3))))

(:action op_4
:parameters (?v3 ?v5)
:precondition (and (pred_8 ?v3) (pred_4 ?v5) 
                  (pred_1 ?v3) (pred_3 ?v5 ?v3) (pred_9 ))
:effect (and (pred_10 ?v5)
   (not (pred_3 ?v5 ?v3)) (not (pred_9 ))))


(:action op_3
:parameters (?v3 ?v8 ?v1)
:precondition (and (pred_8 ?v3) (pred_4 ?v8) (pred_4 ?v1)
                  (pred_1 ?v3) (pred_10 ?v1) (pred_3 ?v8 ?v3))
:effect (and (pred_10 ?v8) (pred_3 ?v1 ?v3)
        (not (pred_10 ?v1)) (not (pred_3 ?v8 ?v3))))

(:action op_2
:parameters (?v3 ?v5)
:precondition (and (pred_8 ?v3) (pred_4 ?v5) 
                  (pred_1 ?v3) (pred_10 ?v5))
:effect (and (pred_9 ) (pred_3 ?v5 ?v3) (not (pred_10 ?v5)))))


	
