(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v4 ?v1)
             (pred_10 ?v11 ?v13)
             (pred_2 ?v4 ?v13)
             (pred_8 ?v3 ?v4 )
	     (pred_9 ?v4)
             (pred_3 ?v8)
             (pred_5 ?v11)
             (pred_1 ?v13)
             (pred_11 ?v4)
             (pred_6 ?v11)
             (pred_12 ?v4)
             (pred_4 ))



(:action op_3
:parameters (?v10 ?v7 ?v9 ?v2)
:precondition (and (pred_3 ?v10) (pred_3 ?v7) (pred_5 ?v9) (pred_1 ?v2)
          (pred_7 ?v10 ?v7) (pred_10 ?v9 ?v2)
                   (pred_2 ?v7 ?v2) (pred_9 ?v10) 
                   (pred_11 ?v7) (pred_6 ?v9))
:effect (and  (pred_12 ?v7) (not (pred_11 ?v7))))


(:action op_2
:parameters (?v10 ?v12)
:precondition (and (pred_3 ?v10) (pred_3 ?v12)
               (pred_9 ?v10) (pred_7 ?v10 ?v12) (pred_12 ?v12))
:effect (and (pred_9 ?v12) (not (pred_9 ?v10))))

(:action op_5
:parameters (?v10 ?v9)
:precondition (and (pred_3 ?v10) (pred_5 ?v9) 
                  (pred_9 ?v10) (pred_8 ?v9 ?v10) (pred_4 ))
:effect (and (pred_6 ?v9)
   (not (pred_8 ?v9 ?v10)) (not (pred_4 ))))


(:action op_4
:parameters (?v10 ?v5 ?v6)
:precondition (and (pred_3 ?v10) (pred_5 ?v5) (pred_5 ?v6)
                  (pred_9 ?v10) (pred_6 ?v6) (pred_8 ?v5 ?v10))
:effect (and (pred_6 ?v5) (pred_8 ?v6 ?v10)
        (not (pred_6 ?v6)) (not (pred_8 ?v5 ?v10))))

(:action op_1
:parameters (?v10 ?v9)
:precondition (and (pred_3 ?v10) (pred_5 ?v9) 
                  (pred_9 ?v10) (pred_6 ?v9))
:effect (and (pred_4 ) (pred_8 ?v9 ?v10) (not (pred_6 ?v9)))))


	
