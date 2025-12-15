(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v8 ?v13)
             (pred_12 ?v11 ?v3)
             (pred_8 ?v8 ?v3)
             (pred_2 ?v1 ?v8 )
	     (pred_1 ?v8)
             (pred_10 ?v9)
             (pred_9 ?v11)
             (pred_4 ?v3)
             (pred_11 ?v8)
             (pred_5 ?v11)
             (pred_7 ?v8)
             (pred_3 ))



(:action op_5
:parameters (?v6 ?v5 ?v7 ?v2)
:precondition (and (pred_10 ?v6) (pred_10 ?v5) (pred_9 ?v7) (pred_4 ?v2)
          (pred_6 ?v6 ?v5) (pred_12 ?v7 ?v2)
                   (pred_8 ?v5 ?v2) (pred_1 ?v6) 
                   (pred_11 ?v5) (pred_5 ?v7))
:effect (and  (pred_7 ?v5) (not (pred_11 ?v5))))


(:action op_1
:parameters (?v6 ?v12)
:precondition (and (pred_10 ?v6) (pred_10 ?v12)
               (pred_1 ?v6) (pred_6 ?v6 ?v12) (pred_7 ?v12))
:effect (and (pred_1 ?v12) (not (pred_1 ?v6))))

(:action op_4
:parameters (?v6 ?v7)
:precondition (and (pred_10 ?v6) (pred_9 ?v7) 
                  (pred_1 ?v6) (pred_2 ?v7 ?v6) (pred_3 ))
:effect (and (pred_5 ?v7)
   (not (pred_2 ?v7 ?v6)) (not (pred_3 ))))


(:action op_2
:parameters (?v6 ?v10 ?v4)
:precondition (and (pred_10 ?v6) (pred_9 ?v10) (pred_9 ?v4)
                  (pred_1 ?v6) (pred_5 ?v4) (pred_2 ?v10 ?v6))
:effect (and (pred_5 ?v10) (pred_2 ?v4 ?v6)
        (not (pred_5 ?v4)) (not (pred_2 ?v10 ?v6))))

(:action op_3
:parameters (?v6 ?v7)
:precondition (and (pred_10 ?v6) (pred_9 ?v7) 
                  (pred_1 ?v6) (pred_5 ?v7))
:effect (and (pred_3 ) (pred_2 ?v7 ?v6) (not (pred_5 ?v7)))))


	
