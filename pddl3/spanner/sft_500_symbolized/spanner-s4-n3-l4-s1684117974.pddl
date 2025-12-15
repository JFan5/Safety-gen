; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1684117974 --problem-name spanner-s4-n3-l4-s1684117974
(define (problem spanner-s4-n3-l4-s1684117974)
 (:domain spanner)
 (:objects 
     obj_03 - type_4
     obj_05 obj_13 obj_06 obj_02 - type_3
     obj_04 obj_11 obj_07 - type_2
     obj_10 obj_09 obj_14 obj_08 - type_1
     obj_01 obj_12 - type_1
    )
 (:init 
    (pred_1 obj_03 obj_01)
    (pred_1 obj_05 obj_14)
    (pred_2 obj_05)
    (pred_1 obj_13 obj_10)
    (pred_2 obj_13)
    (pred_1 obj_06 obj_09)
    (pred_2 obj_06)
    (pred_1 obj_02 obj_09)
    (pred_2 obj_02)
    (pred_6 obj_04)
    (pred_1 obj_04 obj_12)
    (pred_6 obj_11)
    (pred_1 obj_11 obj_12)
    (pred_6 obj_07)
    (pred_1 obj_07 obj_12)
    (pred_5 obj_01 obj_10)
    (pred_5 obj_08 obj_12)
    (pred_5 obj_10 obj_09)
    (pred_5 obj_09 obj_14)
    (pred_5 obj_14 obj_08)
)
 (:goal
  (and
   (pred_3 obj_04)
   (pred_3 obj_11)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_11)) (not (pred_3 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_01)))
  )
)
)
