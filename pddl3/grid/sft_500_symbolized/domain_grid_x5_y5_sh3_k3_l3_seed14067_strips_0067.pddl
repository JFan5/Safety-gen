(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v8 ?v12)
             (pred_1 ?v2 ?v11)
             (pred_7 ?v8 ?v11)
             (pred_9 ?v4 ?v8 )
	     (pred_5 ?v8)
             (pred_6 ?v3)
             (pred_12 ?v2)
             (pred_3 ?v11)
             (pred_2 ?v8)
             (pred_11 ?v2)
             (pred_8 ?v8)
             (pred_4 ))



(:action op_5
:parameters (?v6 ?v5 ?v10 ?v1)
:precondition (and (pred_6 ?v6) (pred_6 ?v5) (pred_12 ?v10) (pred_3 ?v1)
          (pred_10 ?v6 ?v5) (pred_1 ?v10 ?v1)
                   (pred_7 ?v5 ?v1) (pred_5 ?v6) 
                   (pred_2 ?v5) (pred_11 ?v10))
:effect (and  (pred_8 ?v5) (not (pred_2 ?v5))))


(:action op_2
:parameters (?v6 ?v7)
:precondition (and (pred_6 ?v6) (pred_6 ?v7)
               (pred_5 ?v6) (pred_10 ?v6 ?v7) (pred_8 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v6))))

(:action op_4
:parameters (?v6 ?v10)
:precondition (and (pred_6 ?v6) (pred_12 ?v10) 
                  (pred_5 ?v6) (pred_9 ?v10 ?v6) (pred_4 ))
:effect (and (pred_11 ?v10)
   (not (pred_9 ?v10 ?v6)) (not (pred_4 ))))


(:action op_3
:parameters (?v6 ?v13 ?v9)
:precondition (and (pred_6 ?v6) (pred_12 ?v13) (pred_12 ?v9)
                  (pred_5 ?v6) (pred_11 ?v9) (pred_9 ?v13 ?v6))
:effect (and (pred_11 ?v13) (pred_9 ?v9 ?v6)
        (not (pred_11 ?v9)) (not (pred_9 ?v13 ?v6))))

(:action op_1
:parameters (?v6 ?v10)
:precondition (and (pred_6 ?v6) (pred_12 ?v10) 
                  (pred_5 ?v6) (pred_11 ?v10))
:effect (and (pred_4 ) (pred_9 ?v10 ?v6) (not (pred_11 ?v10)))))


	
