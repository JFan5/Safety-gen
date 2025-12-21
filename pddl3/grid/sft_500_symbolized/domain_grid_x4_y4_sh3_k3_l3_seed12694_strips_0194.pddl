(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v1 ?v12)
             (pred_6 ?v8 ?v6)
             (pred_4 ?v1 ?v6)
             (pred_3 ?v2 ?v1 )
	     (pred_2 ?v1)
             (pred_11 ?v4)
             (pred_10 ?v8)
             (pred_1 ?v6)
             (pred_8 ?v1)
             (pred_5 ?v8)
             (pred_9 ?v1)
             (pred_12 ))



(:action op_4
:parameters (?v10 ?v13 ?v9 ?v3)
:precondition (and (pred_11 ?v10) (pred_11 ?v13) (pred_10 ?v9) (pred_1 ?v3)
          (pred_7 ?v10 ?v13) (pred_6 ?v9 ?v3)
                   (pred_4 ?v13 ?v3) (pred_2 ?v10) 
                   (pred_8 ?v13) (pred_5 ?v9))
:effect (and  (pred_9 ?v13) (not (pred_8 ?v13))))


(:action op_2
:parameters (?v10 ?v11)
:precondition (and (pred_11 ?v10) (pred_11 ?v11)
               (pred_2 ?v10) (pred_7 ?v10 ?v11) (pred_9 ?v11))
:effect (and (pred_2 ?v11) (not (pred_2 ?v10))))

(:action op_1
:parameters (?v10 ?v9)
:precondition (and (pred_11 ?v10) (pred_10 ?v9) 
                  (pred_2 ?v10) (pred_3 ?v9 ?v10) (pred_12 ))
:effect (and (pred_5 ?v9)
   (not (pred_3 ?v9 ?v10)) (not (pred_12 ))))


(:action op_5
:parameters (?v10 ?v7 ?v5)
:precondition (and (pred_11 ?v10) (pred_10 ?v7) (pred_10 ?v5)
                  (pred_2 ?v10) (pred_5 ?v5) (pred_3 ?v7 ?v10))
:effect (and (pred_5 ?v7) (pred_3 ?v5 ?v10)
        (not (pred_5 ?v5)) (not (pred_3 ?v7 ?v10))))

(:action op_3
:parameters (?v10 ?v9)
:precondition (and (pred_11 ?v10) (pred_10 ?v9) 
                  (pred_2 ?v10) (pred_5 ?v9))
:effect (and (pred_12 ) (pred_3 ?v9 ?v10) (not (pred_5 ?v9)))))


	
