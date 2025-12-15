; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1443346934 --problem-name spanner-s3-n3-l4-s1443346934
(define (problem spanner-s3-n3-l4-s1443346934)
 (:domain spanner)
 (:objects 
     obj_09 - type_2
     obj_10 obj_02 obj_08 - type_4
     obj_04 obj_12 obj_11 - type_1
     obj_06 obj_07 obj_05 obj_03 - type_5
     obj_13 obj_01 - type_5
    )
 (:init 
    (pred_4 obj_09 obj_13)
    (pred_4 obj_10 obj_06)
    (pred_6 obj_10)
    (pred_4 obj_02 obj_06)
    (pred_6 obj_02)
    (pred_4 obj_08 obj_06)
    (pred_6 obj_08)
    (pred_3 obj_04)
    (pred_4 obj_04 obj_01)
    (pred_3 obj_12)
    (pred_4 obj_12 obj_01)
    (pred_3 obj_11)
    (pred_4 obj_11 obj_01)
    (pred_2 obj_13 obj_06)
    (pred_2 obj_03 obj_01)
    (pred_2 obj_06 obj_07)
    (pred_2 obj_07 obj_05)
    (pred_2 obj_05 obj_03)
)
 (:goal
  (and
   (pred_5 obj_04)
   (pred_5 obj_12)
   (pred_5 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_04)) (not (pred_5 obj_12))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_13)))
  )
)
)
