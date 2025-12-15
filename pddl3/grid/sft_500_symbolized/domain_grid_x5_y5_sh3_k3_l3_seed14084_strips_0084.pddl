(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v2 ?v8)
             (pred_1 ?v5 ?v13)
             (pred_12 ?v2 ?v13)
             (pred_3 ?v11 ?v2 )
	     (pred_10 ?v2)
             (pred_4 ?v3)
             (pred_11 ?v5)
             (pred_9 ?v13)
             (pred_8 ?v2)
             (pred_7 ?v5)
             (pred_2 ?v2)
             (pred_6 ))



(:action op_1
:parameters (?v6 ?v12 ?v7 ?v10)
:precondition (and (pred_4 ?v6) (pred_4 ?v12) (pred_11 ?v7) (pred_9 ?v10)
          (pred_5 ?v6 ?v12) (pred_1 ?v7 ?v10)
                   (pred_12 ?v12 ?v10) (pred_10 ?v6) 
                   (pred_8 ?v12) (pred_7 ?v7))
:effect (and  (pred_2 ?v12) (not (pred_8 ?v12))))


(:action op_2
:parameters (?v6 ?v1)
:precondition (and (pred_4 ?v6) (pred_4 ?v1)
               (pred_10 ?v6) (pred_5 ?v6 ?v1) (pred_2 ?v1))
:effect (and (pred_10 ?v1) (not (pred_10 ?v6))))

(:action op_5
:parameters (?v6 ?v7)
:precondition (and (pred_4 ?v6) (pred_11 ?v7) 
                  (pred_10 ?v6) (pred_3 ?v7 ?v6) (pred_6 ))
:effect (and (pred_7 ?v7)
   (not (pred_3 ?v7 ?v6)) (not (pred_6 ))))


(:action op_4
:parameters (?v6 ?v4 ?v9)
:precondition (and (pred_4 ?v6) (pred_11 ?v4) (pred_11 ?v9)
                  (pred_10 ?v6) (pred_7 ?v9) (pred_3 ?v4 ?v6))
:effect (and (pred_7 ?v4) (pred_3 ?v9 ?v6)
        (not (pred_7 ?v9)) (not (pred_3 ?v4 ?v6))))

(:action op_3
:parameters (?v6 ?v7)
:precondition (and (pred_4 ?v6) (pred_11 ?v7) 
                  (pred_10 ?v6) (pred_7 ?v7))
:effect (and (pred_6 ) (pred_3 ?v7 ?v6) (not (pred_7 ?v7)))))


	
