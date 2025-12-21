(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v11 ?v1)
             (pred_2 ?v2 ?v8)
             (pred_5 ?v11 ?v8)
             (pred_8 ?v3 ?v11 )
	     (pred_1 ?v11)
             (pred_10 ?v5)
             (pred_3 ?v2)
             (pred_12 ?v8)
             (pred_11 ?v11)
             (pred_6 ?v2)
             (pred_4 ?v11)
             (pred_7 ))



(:action op_2
:parameters (?v4 ?v10 ?v7 ?v12)
:precondition (and (pred_10 ?v4) (pred_10 ?v10) (pred_3 ?v7) (pred_12 ?v12)
          (pred_9 ?v4 ?v10) (pred_2 ?v7 ?v12)
                   (pred_5 ?v10 ?v12) (pred_1 ?v4) 
                   (pred_11 ?v10) (pred_6 ?v7))
:effect (and  (pred_4 ?v10) (not (pred_11 ?v10))))


(:action op_3
:parameters (?v4 ?v6)
:precondition (and (pred_10 ?v4) (pred_10 ?v6)
               (pred_1 ?v4) (pred_9 ?v4 ?v6) (pred_4 ?v6))
:effect (and (pred_1 ?v6) (not (pred_1 ?v4))))

(:action op_1
:parameters (?v4 ?v7)
:precondition (and (pred_10 ?v4) (pred_3 ?v7) 
                  (pred_1 ?v4) (pred_8 ?v7 ?v4) (pred_7 ))
:effect (and (pred_6 ?v7)
   (not (pred_8 ?v7 ?v4)) (not (pred_7 ))))


(:action op_5
:parameters (?v4 ?v13 ?v9)
:precondition (and (pred_10 ?v4) (pred_3 ?v13) (pred_3 ?v9)
                  (pred_1 ?v4) (pred_6 ?v9) (pred_8 ?v13 ?v4))
:effect (and (pred_6 ?v13) (pred_8 ?v9 ?v4)
        (not (pred_6 ?v9)) (not (pred_8 ?v13 ?v4))))

(:action op_4
:parameters (?v4 ?v7)
:precondition (and (pred_10 ?v4) (pred_3 ?v7) 
                  (pred_1 ?v4) (pred_6 ?v7))
:effect (and (pred_7 ) (pred_8 ?v7 ?v4) (not (pred_6 ?v7)))))


	
