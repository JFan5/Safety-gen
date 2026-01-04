; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1480402990 --problem-name spanner-s3-n3-l4-s1480402990
(define (problem spanner-s3-n3-l4-s1480402990)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_01 obj_12 obj_02 - type_1
     obj_04 obj_05 obj_09 - type_2
     obj_10 obj_13 obj_08 obj_03 - type_5
     obj_07 obj_06 - type_5
    )
 (:init 
    (pred_5 obj_11 obj_07)
    (pred_5 obj_01 obj_10)
    (pred_2 obj_01)
    (pred_5 obj_12 obj_08)
    (pred_2 obj_12)
    (pred_5 obj_02 obj_08)
    (pred_2 obj_02)
    (pred_4 obj_04)
    (pred_5 obj_04 obj_06)
    (pred_4 obj_05)
    (pred_5 obj_05 obj_06)
    (pred_4 obj_09)
    (pred_5 obj_09 obj_06)
    (pred_3 obj_07 obj_10)
    (pred_3 obj_03 obj_06)
    (pred_3 obj_10 obj_13)
    (pred_3 obj_13 obj_08)
    (pred_3 obj_08 obj_03)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_05)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_04)) (not (pred_1 obj_05))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_07)))
  )
)
)
