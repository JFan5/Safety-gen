(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v2 ?v10)
             (pred_1 ?v12 ?v11)
             (pred_3 ?v2 ?v11)
             (pred_7 ?v4 ?v2 )
	     (pred_11 ?v2)
             (pred_10 ?v8)
             (pred_4 ?v12)
             (pred_8 ?v11)
             (pred_6 ?v2)
             (pred_5 ?v12)
             (pred_2 ?v2)
             (pred_12 ))



(:action op_2
:parameters (?v6 ?v5 ?v9 ?v13)
:precondition (and (pred_10 ?v6) (pred_10 ?v5) (pred_4 ?v9) (pred_8 ?v13)
          (pred_9 ?v6 ?v5) (pred_1 ?v9 ?v13)
                   (pred_3 ?v5 ?v13) (pred_11 ?v6) 
                   (pred_6 ?v5) (pred_5 ?v9))
:effect (and  (pred_2 ?v5) (not (pred_6 ?v5))))


(:action op_1
:parameters (?v6 ?v7)
:precondition (and (pred_10 ?v6) (pred_10 ?v7)
               (pred_11 ?v6) (pred_9 ?v6 ?v7) (pred_2 ?v7))
:effect (and (pred_11 ?v7) (not (pred_11 ?v6))))

(:action op_4
:parameters (?v6 ?v9)
:precondition (and (pred_10 ?v6) (pred_4 ?v9) 
                  (pred_11 ?v6) (pred_7 ?v9 ?v6) (pred_12 ))
:effect (and (pred_5 ?v9)
   (not (pred_7 ?v9 ?v6)) (not (pred_12 ))))


(:action op_5
:parameters (?v6 ?v1 ?v3)
:precondition (and (pred_10 ?v6) (pred_4 ?v1) (pred_4 ?v3)
                  (pred_11 ?v6) (pred_5 ?v3) (pred_7 ?v1 ?v6))
:effect (and (pred_5 ?v1) (pred_7 ?v3 ?v6)
        (not (pred_5 ?v3)) (not (pred_7 ?v1 ?v6))))

(:action op_3
:parameters (?v6 ?v9)
:precondition (and (pred_10 ?v6) (pred_4 ?v9) 
                  (pred_11 ?v6) (pred_5 ?v9))
:effect (and (pred_12 ) (pred_7 ?v9 ?v6) (not (pred_5 ?v9)))))


	
