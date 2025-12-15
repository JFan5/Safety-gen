(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v9 ?v1)
             (pred_9 ?v12 ?v8)
             (pred_8 ?v9 ?v8)
             (pred_6 ?v3 ?v9 )
	     (pred_7 ?v9)
             (pred_5 ?v5)
             (pred_11 ?v12)
             (pred_3 ?v8)
             (pred_2 ?v9)
             (pred_4 ?v12)
             (pred_1 ?v9)
             (pred_12 ))



(:action op_5
:parameters (?v4 ?v6 ?v11 ?v13)
:precondition (and (pred_5 ?v4) (pred_5 ?v6) (pred_11 ?v11) (pred_3 ?v13)
          (pred_10 ?v4 ?v6) (pred_9 ?v11 ?v13)
                   (pred_8 ?v6 ?v13) (pred_7 ?v4) 
                   (pred_2 ?v6) (pred_4 ?v11))
:effect (and  (pred_1 ?v6) (not (pred_2 ?v6))))


(:action op_3
:parameters (?v4 ?v10)
:precondition (and (pred_5 ?v4) (pred_5 ?v10)
               (pred_7 ?v4) (pred_10 ?v4 ?v10) (pred_1 ?v10))
:effect (and (pred_7 ?v10) (not (pred_7 ?v4))))

(:action op_2
:parameters (?v4 ?v11)
:precondition (and (pred_5 ?v4) (pred_11 ?v11) 
                  (pred_7 ?v4) (pred_6 ?v11 ?v4) (pred_12 ))
:effect (and (pred_4 ?v11)
   (not (pred_6 ?v11 ?v4)) (not (pred_12 ))))


(:action op_1
:parameters (?v4 ?v7 ?v2)
:precondition (and (pred_5 ?v4) (pred_11 ?v7) (pred_11 ?v2)
                  (pred_7 ?v4) (pred_4 ?v2) (pred_6 ?v7 ?v4))
:effect (and (pred_4 ?v7) (pred_6 ?v2 ?v4)
        (not (pred_4 ?v2)) (not (pred_6 ?v7 ?v4))))

(:action op_4
:parameters (?v4 ?v11)
:precondition (and (pred_5 ?v4) (pred_11 ?v11) 
                  (pred_7 ?v4) (pred_4 ?v11))
:effect (and (pred_12 ) (pred_6 ?v11 ?v4) (not (pred_4 ?v11)))))


	
