(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v10 ?v13)
             (pred_1 ?v5 ?v8)
             (pred_11 ?v10 ?v8)
             (pred_8 ?v3 ?v10 )
	     (pred_4 ?v10)
             (pred_12 ?v4)
             (pred_9 ?v5)
             (pred_10 ?v8)
             (pred_7 ?v10)
             (pred_5 ?v5)
             (pred_6 ?v10)
             (pred_2 ))



(:action op_4
:parameters (?v6 ?v1 ?v11 ?v2)
:precondition (and (pred_12 ?v6) (pred_12 ?v1) (pred_9 ?v11) (pred_10 ?v2)
          (pred_3 ?v6 ?v1) (pred_1 ?v11 ?v2)
                   (pred_11 ?v1 ?v2) (pred_4 ?v6) 
                   (pred_7 ?v1) (pred_5 ?v11))
:effect (and  (pred_6 ?v1) (not (pred_7 ?v1))))


(:action op_5
:parameters (?v6 ?v9)
:precondition (and (pred_12 ?v6) (pred_12 ?v9)
               (pred_4 ?v6) (pred_3 ?v6 ?v9) (pred_6 ?v9))
:effect (and (pred_4 ?v9) (not (pred_4 ?v6))))

(:action op_2
:parameters (?v6 ?v11)
:precondition (and (pred_12 ?v6) (pred_9 ?v11) 
                  (pred_4 ?v6) (pred_8 ?v11 ?v6) (pred_2 ))
:effect (and (pred_5 ?v11)
   (not (pred_8 ?v11 ?v6)) (not (pred_2 ))))


(:action op_1
:parameters (?v6 ?v7 ?v12)
:precondition (and (pred_12 ?v6) (pred_9 ?v7) (pred_9 ?v12)
                  (pred_4 ?v6) (pred_5 ?v12) (pred_8 ?v7 ?v6))
:effect (and (pred_5 ?v7) (pred_8 ?v12 ?v6)
        (not (pred_5 ?v12)) (not (pred_8 ?v7 ?v6))))

(:action op_3
:parameters (?v6 ?v11)
:precondition (and (pred_12 ?v6) (pred_9 ?v11) 
                  (pred_4 ?v6) (pred_5 ?v11))
:effect (and (pred_2 ) (pred_8 ?v11 ?v6) (not (pred_5 ?v11)))))


	
