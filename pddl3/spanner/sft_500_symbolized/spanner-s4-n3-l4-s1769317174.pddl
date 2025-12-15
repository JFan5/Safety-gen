; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1769317174 --problem-name spanner-s4-n3-l4-s1769317174
(define (problem spanner-s4-n3-l4-s1769317174)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_11 obj_09 obj_08 obj_07 - type_5
     obj_01 obj_05 obj_14 - type_3
     obj_06 obj_03 obj_04 obj_13 - type_1
     obj_02 obj_12 - type_1
    )
 (:init 
    (pred_6 obj_10 obj_02)
    (pred_6 obj_11 obj_06)
    (pred_3 obj_11)
    (pred_6 obj_09 obj_06)
    (pred_3 obj_09)
    (pred_6 obj_08 obj_04)
    (pred_3 obj_08)
    (pred_6 obj_07 obj_04)
    (pred_3 obj_07)
    (pred_2 obj_01)
    (pred_6 obj_01 obj_12)
    (pred_2 obj_05)
    (pred_6 obj_05 obj_12)
    (pred_2 obj_14)
    (pred_6 obj_14 obj_12)
    (pred_4 obj_02 obj_06)
    (pred_4 obj_13 obj_12)
    (pred_4 obj_06 obj_03)
    (pred_4 obj_03 obj_04)
    (pred_4 obj_04 obj_13)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_05)
   (pred_1 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_01)) (not (pred_1 obj_05))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
