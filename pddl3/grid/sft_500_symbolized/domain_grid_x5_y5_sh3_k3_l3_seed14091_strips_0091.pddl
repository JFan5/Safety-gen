(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v2 ?v9)
             (pred_8 ?v12 ?v1)
             (pred_7 ?v2 ?v1)
             (pred_3 ?v13 ?v2 )
	     (pred_12 ?v2)
             (pred_5 ?v10)
             (pred_6 ?v12)
             (pred_4 ?v1)
             (pred_11 ?v2)
             (pred_10 ?v12)
             (pred_9 ?v2)
             (pred_1 ))



(:action op_1
:parameters (?v6 ?v4 ?v3 ?v11)
:precondition (and (pred_5 ?v6) (pred_5 ?v4) (pred_6 ?v3) (pred_4 ?v11)
          (pred_2 ?v6 ?v4) (pred_8 ?v3 ?v11)
                   (pred_7 ?v4 ?v11) (pred_12 ?v6) 
                   (pred_11 ?v4) (pred_10 ?v3))
:effect (and  (pred_9 ?v4) (not (pred_11 ?v4))))


(:action op_3
:parameters (?v6 ?v5)
:precondition (and (pred_5 ?v6) (pred_5 ?v5)
               (pred_12 ?v6) (pred_2 ?v6 ?v5) (pred_9 ?v5))
:effect (and (pred_12 ?v5) (not (pred_12 ?v6))))

(:action op_4
:parameters (?v6 ?v3)
:precondition (and (pred_5 ?v6) (pred_6 ?v3) 
                  (pred_12 ?v6) (pred_3 ?v3 ?v6) (pred_1 ))
:effect (and (pred_10 ?v3)
   (not (pred_3 ?v3 ?v6)) (not (pred_1 ))))


(:action op_5
:parameters (?v6 ?v8 ?v7)
:precondition (and (pred_5 ?v6) (pred_6 ?v8) (pred_6 ?v7)
                  (pred_12 ?v6) (pred_10 ?v7) (pred_3 ?v8 ?v6))
:effect (and (pred_10 ?v8) (pred_3 ?v7 ?v6)
        (not (pred_10 ?v7)) (not (pred_3 ?v8 ?v6))))

(:action op_2
:parameters (?v6 ?v3)
:precondition (and (pred_5 ?v6) (pred_6 ?v3) 
                  (pred_12 ?v6) (pred_10 ?v3))
:effect (and (pred_1 ) (pred_3 ?v3 ?v6) (not (pred_10 ?v3)))))


	
