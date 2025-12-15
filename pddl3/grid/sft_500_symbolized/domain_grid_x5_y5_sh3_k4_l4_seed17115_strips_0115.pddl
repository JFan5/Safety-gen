(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v9 ?v11)
             (pred_2 ?v3 ?v13)
             (pred_3 ?v9 ?v13)
             (pred_9 ?v4 ?v9 )
	     (pred_11 ?v9)
             (pred_4 ?v2)
             (pred_6 ?v3)
             (pred_1 ?v13)
             (pred_12 ?v9)
             (pred_8 ?v3)
             (pred_10 ?v9)
             (pred_5 ))



(:action op_4
:parameters (?v6 ?v12 ?v7 ?v8)
:precondition (and (pred_4 ?v6) (pred_4 ?v12) (pred_6 ?v7) (pred_1 ?v8)
          (pred_7 ?v6 ?v12) (pred_2 ?v7 ?v8)
                   (pred_3 ?v12 ?v8) (pred_11 ?v6) 
                   (pred_12 ?v12) (pred_8 ?v7))
:effect (and  (pred_10 ?v12) (not (pred_12 ?v12))))


(:action op_2
:parameters (?v6 ?v10)
:precondition (and (pred_4 ?v6) (pred_4 ?v10)
               (pred_11 ?v6) (pred_7 ?v6 ?v10) (pred_10 ?v10))
:effect (and (pred_11 ?v10) (not (pred_11 ?v6))))

(:action op_3
:parameters (?v6 ?v7)
:precondition (and (pred_4 ?v6) (pred_6 ?v7) 
                  (pred_11 ?v6) (pred_9 ?v7 ?v6) (pred_5 ))
:effect (and (pred_8 ?v7)
   (not (pred_9 ?v7 ?v6)) (not (pred_5 ))))


(:action op_5
:parameters (?v6 ?v1 ?v5)
:precondition (and (pred_4 ?v6) (pred_6 ?v1) (pred_6 ?v5)
                  (pred_11 ?v6) (pred_8 ?v5) (pred_9 ?v1 ?v6))
:effect (and (pred_8 ?v1) (pred_9 ?v5 ?v6)
        (not (pred_8 ?v5)) (not (pred_9 ?v1 ?v6))))

(:action op_1
:parameters (?v6 ?v7)
:precondition (and (pred_4 ?v6) (pred_6 ?v7) 
                  (pred_11 ?v6) (pred_8 ?v7))
:effect (and (pred_5 ) (pred_9 ?v7 ?v6) (not (pred_8 ?v7)))))


	
