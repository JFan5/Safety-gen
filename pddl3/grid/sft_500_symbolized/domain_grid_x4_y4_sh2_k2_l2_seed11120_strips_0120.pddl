(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v12 ?v9)
             (pred_6 ?v5 ?v11)
             (pred_12 ?v12 ?v11)
             (pred_3 ?v8 ?v12 )
	     (pred_10 ?v12)
             (pred_5 ?v13)
             (pred_11 ?v5)
             (pred_1 ?v11)
             (pred_2 ?v12)
             (pred_7 ?v5)
             (pred_8 ?v12)
             (pred_9 ))



(:action op_2
:parameters (?v6 ?v2 ?v1 ?v10)
:precondition (and (pred_5 ?v6) (pred_5 ?v2) (pred_11 ?v1) (pred_1 ?v10)
          (pred_4 ?v6 ?v2) (pred_6 ?v1 ?v10)
                   (pred_12 ?v2 ?v10) (pred_10 ?v6) 
                   (pred_2 ?v2) (pred_7 ?v1))
:effect (and  (pred_8 ?v2) (not (pred_2 ?v2))))


(:action op_3
:parameters (?v6 ?v3)
:precondition (and (pred_5 ?v6) (pred_5 ?v3)
               (pred_10 ?v6) (pred_4 ?v6 ?v3) (pred_8 ?v3))
:effect (and (pred_10 ?v3) (not (pred_10 ?v6))))

(:action op_4
:parameters (?v6 ?v1)
:precondition (and (pred_5 ?v6) (pred_11 ?v1) 
                  (pred_10 ?v6) (pred_3 ?v1 ?v6) (pred_9 ))
:effect (and (pred_7 ?v1)
   (not (pred_3 ?v1 ?v6)) (not (pred_9 ))))


(:action op_1
:parameters (?v6 ?v7 ?v4)
:precondition (and (pred_5 ?v6) (pred_11 ?v7) (pred_11 ?v4)
                  (pred_10 ?v6) (pred_7 ?v4) (pred_3 ?v7 ?v6))
:effect (and (pred_7 ?v7) (pred_3 ?v4 ?v6)
        (not (pred_7 ?v4)) (not (pred_3 ?v7 ?v6))))

(:action op_5
:parameters (?v6 ?v1)
:precondition (and (pred_5 ?v6) (pred_11 ?v1) 
                  (pred_10 ?v6) (pred_7 ?v1))
:effect (and (pred_9 ) (pred_3 ?v1 ?v6) (not (pred_7 ?v1)))))


	
