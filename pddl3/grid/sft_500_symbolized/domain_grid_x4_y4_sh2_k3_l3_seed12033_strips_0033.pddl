(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v7 ?v5)
             (pred_12 ?v8 ?v6)
             (pred_11 ?v7 ?v6)
             (pred_10 ?v13 ?v7 )
	     (pred_4 ?v7)
             (pred_5 ?v1)
             (pred_7 ?v8)
             (pred_9 ?v6)
             (pred_1 ?v7)
             (pred_3 ?v8)
             (pred_6 ?v7)
             (pred_8 ))



(:action op_3
:parameters (?v4 ?v10 ?v12 ?v2)
:precondition (and (pred_5 ?v4) (pred_5 ?v10) (pred_7 ?v12) (pred_9 ?v2)
          (pred_2 ?v4 ?v10) (pred_12 ?v12 ?v2)
                   (pred_11 ?v10 ?v2) (pred_4 ?v4) 
                   (pred_1 ?v10) (pred_3 ?v12))
:effect (and  (pred_6 ?v10) (not (pred_1 ?v10))))


(:action op_1
:parameters (?v4 ?v9)
:precondition (and (pred_5 ?v4) (pred_5 ?v9)
               (pred_4 ?v4) (pred_2 ?v4 ?v9) (pred_6 ?v9))
:effect (and (pred_4 ?v9) (not (pred_4 ?v4))))

(:action op_5
:parameters (?v4 ?v12)
:precondition (and (pred_5 ?v4) (pred_7 ?v12) 
                  (pred_4 ?v4) (pred_10 ?v12 ?v4) (pred_8 ))
:effect (and (pred_3 ?v12)
   (not (pred_10 ?v12 ?v4)) (not (pred_8 ))))


(:action op_4
:parameters (?v4 ?v11 ?v3)
:precondition (and (pred_5 ?v4) (pred_7 ?v11) (pred_7 ?v3)
                  (pred_4 ?v4) (pred_3 ?v3) (pred_10 ?v11 ?v4))
:effect (and (pred_3 ?v11) (pred_10 ?v3 ?v4)
        (not (pred_3 ?v3)) (not (pred_10 ?v11 ?v4))))

(:action op_2
:parameters (?v4 ?v12)
:precondition (and (pred_5 ?v4) (pred_7 ?v12) 
                  (pred_4 ?v4) (pred_3 ?v12))
:effect (and (pred_8 ) (pred_10 ?v12 ?v4) (not (pred_3 ?v12)))))


	
