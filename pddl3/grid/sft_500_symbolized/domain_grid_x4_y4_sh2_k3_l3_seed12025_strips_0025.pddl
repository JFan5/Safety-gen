(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v11 ?v12)
             (pred_1 ?v2 ?v6)
             (pred_5 ?v11 ?v6)
             (pred_3 ?v1 ?v11 )
	     (pred_4 ?v11)
             (pred_9 ?v8)
             (pred_8 ?v2)
             (pred_11 ?v6)
             (pred_7 ?v11)
             (pred_2 ?v2)
             (pred_12 ?v11)
             (pred_10 ))



(:action op_1
:parameters (?v10 ?v3 ?v7 ?v13)
:precondition (and (pred_9 ?v10) (pred_9 ?v3) (pred_8 ?v7) (pred_11 ?v13)
          (pred_6 ?v10 ?v3) (pred_1 ?v7 ?v13)
                   (pred_5 ?v3 ?v13) (pred_4 ?v10) 
                   (pred_7 ?v3) (pred_2 ?v7))
:effect (and  (pred_12 ?v3) (not (pred_7 ?v3))))


(:action op_3
:parameters (?v10 ?v4)
:precondition (and (pred_9 ?v10) (pred_9 ?v4)
               (pred_4 ?v10) (pred_6 ?v10 ?v4) (pred_12 ?v4))
:effect (and (pred_4 ?v4) (not (pred_4 ?v10))))

(:action op_4
:parameters (?v10 ?v7)
:precondition (and (pred_9 ?v10) (pred_8 ?v7) 
                  (pred_4 ?v10) (pred_3 ?v7 ?v10) (pred_10 ))
:effect (and (pred_2 ?v7)
   (not (pred_3 ?v7 ?v10)) (not (pred_10 ))))


(:action op_5
:parameters (?v10 ?v9 ?v5)
:precondition (and (pred_9 ?v10) (pred_8 ?v9) (pred_8 ?v5)
                  (pred_4 ?v10) (pred_2 ?v5) (pred_3 ?v9 ?v10))
:effect (and (pred_2 ?v9) (pred_3 ?v5 ?v10)
        (not (pred_2 ?v5)) (not (pred_3 ?v9 ?v10))))

(:action op_2
:parameters (?v10 ?v7)
:precondition (and (pred_9 ?v10) (pred_8 ?v7) 
                  (pred_4 ?v10) (pred_2 ?v7))
:effect (and (pred_10 ) (pred_3 ?v7 ?v10) (not (pred_2 ?v7)))))


	
