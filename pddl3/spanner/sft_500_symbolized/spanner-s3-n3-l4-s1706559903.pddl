; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1706559903 --problem-name spanner-s3-n3-l4-s1706559903
(define (problem spanner-s3-n3-l4-s1706559903)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_08 obj_09 obj_07 - type_5
     obj_05 obj_10 obj_04 - type_2
     obj_06 obj_01 obj_11 obj_12 - type_1
     obj_03 obj_13 - type_1
    )
 (:init 
    (pred_4 obj_02 obj_03)
    (pred_4 obj_08 obj_11)
    (pred_1 obj_08)
    (pred_4 obj_09 obj_12)
    (pred_1 obj_09)
    (pred_4 obj_07 obj_01)
    (pred_1 obj_07)
    (pred_2 obj_05)
    (pred_4 obj_05 obj_13)
    (pred_2 obj_10)
    (pred_4 obj_10 obj_13)
    (pred_2 obj_04)
    (pred_4 obj_04 obj_13)
    (pred_3 obj_03 obj_06)
    (pred_3 obj_12 obj_13)
    (pred_3 obj_06 obj_01)
    (pred_3 obj_01 obj_11)
    (pred_3 obj_11 obj_12)
)
 (:goal
  (and
   (pred_5 obj_05)
   (pred_5 obj_10)
   (pred_5 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_10)) (not (pred_5 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_03)))
  )
)
)
