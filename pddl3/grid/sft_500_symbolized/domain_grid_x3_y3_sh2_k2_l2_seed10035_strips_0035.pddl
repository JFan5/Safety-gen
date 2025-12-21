(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v7 ?v5)
             (pred_12 ?v1 ?v8)
             (pred_6 ?v7 ?v8)
             (pred_3 ?v2 ?v7 )
	     (pred_11 ?v7)
             (pred_1 ?v9)
             (pred_10 ?v1)
             (pred_9 ?v8)
             (pred_8 ?v7)
             (pred_7 ?v1)
             (pred_4 ?v7)
             (pred_2 ))



(:action op_1
:parameters (?v6 ?v4 ?v10 ?v13)
:precondition (and (pred_1 ?v6) (pred_1 ?v4) (pred_10 ?v10) (pred_9 ?v13)
          (pred_5 ?v6 ?v4) (pred_12 ?v10 ?v13)
                   (pred_6 ?v4 ?v13) (pred_11 ?v6) 
                   (pred_8 ?v4) (pred_7 ?v10))
:effect (and  (pred_4 ?v4) (not (pred_8 ?v4))))


(:action op_5
:parameters (?v6 ?v12)
:precondition (and (pred_1 ?v6) (pred_1 ?v12)
               (pred_11 ?v6) (pred_5 ?v6 ?v12) (pred_4 ?v12))
:effect (and (pred_11 ?v12) (not (pred_11 ?v6))))

(:action op_4
:parameters (?v6 ?v10)
:precondition (and (pred_1 ?v6) (pred_10 ?v10) 
                  (pred_11 ?v6) (pred_3 ?v10 ?v6) (pred_2 ))
:effect (and (pred_7 ?v10)
   (not (pred_3 ?v10 ?v6)) (not (pred_2 ))))


(:action op_2
:parameters (?v6 ?v3 ?v11)
:precondition (and (pred_1 ?v6) (pred_10 ?v3) (pred_10 ?v11)
                  (pred_11 ?v6) (pred_7 ?v11) (pred_3 ?v3 ?v6))
:effect (and (pred_7 ?v3) (pred_3 ?v11 ?v6)
        (not (pred_7 ?v11)) (not (pred_3 ?v3 ?v6))))

(:action op_3
:parameters (?v6 ?v10)
:precondition (and (pred_1 ?v6) (pred_10 ?v10) 
                  (pred_11 ?v6) (pred_7 ?v10))
:effect (and (pred_2 ) (pred_3 ?v10 ?v6) (not (pred_7 ?v10)))))


	
