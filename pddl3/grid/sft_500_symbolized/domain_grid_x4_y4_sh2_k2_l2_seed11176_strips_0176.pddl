(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v9 ?v10)
             (pred_12 ?v7 ?v2)
             (pred_1 ?v9 ?v2)
             (pred_11 ?v13 ?v9 )
	     (pred_10 ?v9)
             (pred_7 ?v5)
             (pred_6 ?v7)
             (pred_5 ?v2)
             (pred_2 ?v9)
             (pred_4 ?v7)
             (pred_8 ?v9)
             (pred_3 ))



(:action op_1
:parameters (?v6 ?v8 ?v1 ?v12)
:precondition (and (pred_7 ?v6) (pred_7 ?v8) (pred_6 ?v1) (pred_5 ?v12)
          (pred_9 ?v6 ?v8) (pred_12 ?v1 ?v12)
                   (pred_1 ?v8 ?v12) (pred_10 ?v6) 
                   (pred_2 ?v8) (pred_4 ?v1))
:effect (and  (pred_8 ?v8) (not (pred_2 ?v8))))


(:action op_4
:parameters (?v6 ?v3)
:precondition (and (pred_7 ?v6) (pred_7 ?v3)
               (pred_10 ?v6) (pred_9 ?v6 ?v3) (pred_8 ?v3))
:effect (and (pred_10 ?v3) (not (pred_10 ?v6))))

(:action op_5
:parameters (?v6 ?v1)
:precondition (and (pred_7 ?v6) (pred_6 ?v1) 
                  (pred_10 ?v6) (pred_11 ?v1 ?v6) (pred_3 ))
:effect (and (pred_4 ?v1)
   (not (pred_11 ?v1 ?v6)) (not (pred_3 ))))


(:action op_3
:parameters (?v6 ?v4 ?v11)
:precondition (and (pred_7 ?v6) (pred_6 ?v4) (pred_6 ?v11)
                  (pred_10 ?v6) (pred_4 ?v11) (pred_11 ?v4 ?v6))
:effect (and (pred_4 ?v4) (pred_11 ?v11 ?v6)
        (not (pred_4 ?v11)) (not (pred_11 ?v4 ?v6))))

(:action op_2
:parameters (?v6 ?v1)
:precondition (and (pred_7 ?v6) (pred_6 ?v1) 
                  (pred_10 ?v6) (pred_4 ?v1))
:effect (and (pred_3 ) (pred_11 ?v1 ?v6) (not (pred_4 ?v1)))))


	
