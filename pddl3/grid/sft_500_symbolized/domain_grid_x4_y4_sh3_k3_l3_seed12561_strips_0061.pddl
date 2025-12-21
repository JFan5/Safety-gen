(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v3 ?v8)
             (pred_1 ?v1 ?v7)
             (pred_6 ?v3 ?v7)
             (pred_4 ?v13 ?v3 )
	     (pred_7 ?v3)
             (pred_8 ?v12)
             (pred_10 ?v1)
             (pred_11 ?v7)
             (pred_9 ?v3)
             (pred_3 ?v1)
             (pred_5 ?v3)
             (pred_2 ))



(:action op_1
:parameters (?v4 ?v6 ?v11 ?v2)
:precondition (and (pred_8 ?v4) (pred_8 ?v6) (pred_10 ?v11) (pred_11 ?v2)
          (pred_12 ?v4 ?v6) (pred_1 ?v11 ?v2)
                   (pred_6 ?v6 ?v2) (pred_7 ?v4) 
                   (pred_9 ?v6) (pred_3 ?v11))
:effect (and  (pred_5 ?v6) (not (pred_9 ?v6))))


(:action op_3
:parameters (?v4 ?v9)
:precondition (and (pred_8 ?v4) (pred_8 ?v9)
               (pred_7 ?v4) (pred_12 ?v4 ?v9) (pred_5 ?v9))
:effect (and (pred_7 ?v9) (not (pred_7 ?v4))))

(:action op_5
:parameters (?v4 ?v11)
:precondition (and (pred_8 ?v4) (pred_10 ?v11) 
                  (pred_7 ?v4) (pred_4 ?v11 ?v4) (pred_2 ))
:effect (and (pred_3 ?v11)
   (not (pred_4 ?v11 ?v4)) (not (pred_2 ))))


(:action op_2
:parameters (?v4 ?v10 ?v5)
:precondition (and (pred_8 ?v4) (pred_10 ?v10) (pred_10 ?v5)
                  (pred_7 ?v4) (pred_3 ?v5) (pred_4 ?v10 ?v4))
:effect (and (pred_3 ?v10) (pred_4 ?v5 ?v4)
        (not (pred_3 ?v5)) (not (pred_4 ?v10 ?v4))))

(:action op_4
:parameters (?v4 ?v11)
:precondition (and (pred_8 ?v4) (pred_10 ?v11) 
                  (pred_7 ?v4) (pred_3 ?v11))
:effect (and (pred_2 ) (pred_4 ?v11 ?v4) (not (pred_3 ?v11)))))


	
