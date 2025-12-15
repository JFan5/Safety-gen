(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v2 ?v1)
             (pred_9 ?v8 ?v13)
             (pred_2 ?v2 ?v13)
             (pred_3 ?v3 ?v2 )
	     (pred_10 ?v2)
             (pred_7 ?v11)
             (pred_1 ?v8)
             (pred_8 ?v13)
             (pred_5 ?v2)
             (pred_11 ?v8)
             (pred_4 ?v2)
             (pred_12 ))



(:action op_1
:parameters (?v4 ?v6 ?v10 ?v12)
:precondition (and (pred_7 ?v4) (pred_7 ?v6) (pred_1 ?v10) (pred_8 ?v12)
          (pred_6 ?v4 ?v6) (pred_9 ?v10 ?v12)
                   (pred_2 ?v6 ?v12) (pred_10 ?v4) 
                   (pred_5 ?v6) (pred_11 ?v10))
:effect (and  (pred_4 ?v6) (not (pred_5 ?v6))))


(:action op_3
:parameters (?v4 ?v9)
:precondition (and (pred_7 ?v4) (pred_7 ?v9)
               (pred_10 ?v4) (pred_6 ?v4 ?v9) (pred_4 ?v9))
:effect (and (pred_10 ?v9) (not (pred_10 ?v4))))

(:action op_4
:parameters (?v4 ?v10)
:precondition (and (pred_7 ?v4) (pred_1 ?v10) 
                  (pred_10 ?v4) (pred_3 ?v10 ?v4) (pred_12 ))
:effect (and (pred_11 ?v10)
   (not (pred_3 ?v10 ?v4)) (not (pred_12 ))))


(:action op_2
:parameters (?v4 ?v7 ?v5)
:precondition (and (pred_7 ?v4) (pred_1 ?v7) (pred_1 ?v5)
                  (pred_10 ?v4) (pred_11 ?v5) (pred_3 ?v7 ?v4))
:effect (and (pred_11 ?v7) (pred_3 ?v5 ?v4)
        (not (pred_11 ?v5)) (not (pred_3 ?v7 ?v4))))

(:action op_5
:parameters (?v4 ?v10)
:precondition (and (pred_7 ?v4) (pred_1 ?v10) 
                  (pred_10 ?v4) (pred_11 ?v10))
:effect (and (pred_12 ) (pred_3 ?v10 ?v4) (not (pred_11 ?v10)))))


	
