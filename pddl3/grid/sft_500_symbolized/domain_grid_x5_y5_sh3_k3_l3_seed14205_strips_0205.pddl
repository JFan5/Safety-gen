(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v8 ?v3)
             (pred_9 ?v5 ?v6)
             (pred_6 ?v8 ?v6)
             (pred_2 ?v13 ?v8 )
	     (pred_11 ?v8)
             (pred_5 ?v2)
             (pred_12 ?v5)
             (pred_10 ?v6)
             (pred_4 ?v8)
             (pred_3 ?v5)
             (pred_7 ?v8)
             (pred_1 ))



(:action op_5
:parameters (?v4 ?v7 ?v9 ?v12)
:precondition (and (pred_5 ?v4) (pred_5 ?v7) (pred_12 ?v9) (pred_10 ?v12)
          (pred_8 ?v4 ?v7) (pred_9 ?v9 ?v12)
                   (pred_6 ?v7 ?v12) (pred_11 ?v4) 
                   (pred_4 ?v7) (pred_3 ?v9))
:effect (and  (pred_7 ?v7) (not (pred_4 ?v7))))


(:action op_2
:parameters (?v4 ?v1)
:precondition (and (pred_5 ?v4) (pred_5 ?v1)
               (pred_11 ?v4) (pred_8 ?v4 ?v1) (pred_7 ?v1))
:effect (and (pred_11 ?v1) (not (pred_11 ?v4))))

(:action op_4
:parameters (?v4 ?v9)
:precondition (and (pred_5 ?v4) (pred_12 ?v9) 
                  (pred_11 ?v4) (pred_2 ?v9 ?v4) (pred_1 ))
:effect (and (pred_3 ?v9)
   (not (pred_2 ?v9 ?v4)) (not (pred_1 ))))


(:action op_3
:parameters (?v4 ?v11 ?v10)
:precondition (and (pred_5 ?v4) (pred_12 ?v11) (pred_12 ?v10)
                  (pred_11 ?v4) (pred_3 ?v10) (pred_2 ?v11 ?v4))
:effect (and (pred_3 ?v11) (pred_2 ?v10 ?v4)
        (not (pred_3 ?v10)) (not (pred_2 ?v11 ?v4))))

(:action op_1
:parameters (?v4 ?v9)
:precondition (and (pred_5 ?v4) (pred_12 ?v9) 
                  (pred_11 ?v4) (pred_3 ?v9))
:effect (and (pred_1 ) (pred_2 ?v9 ?v4) (not (pred_3 ?v9)))))


	
