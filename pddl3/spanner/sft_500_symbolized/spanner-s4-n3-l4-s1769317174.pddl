; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1769317174 --problem-name spanner-s4-n3-l4-s1769317174
(define (problem spanner-s4-n3-l4-s1769317174)
 (:domain spanner)
 (:objects 
     obj_01 - type_1
     obj_09 obj_12 obj_02 obj_05 - type_2
     obj_06 obj_07 obj_08 - type_4
     obj_11 obj_13 obj_03 obj_04 - type_5
     obj_10 obj_14 - type_5
    )
 (:init 
    (pred_3 obj_01 obj_10)
    (pred_3 obj_09 obj_11)
    (pred_5 obj_09)
    (pred_3 obj_12 obj_11)
    (pred_5 obj_12)
    (pred_3 obj_02 obj_03)
    (pred_5 obj_02)
    (pred_3 obj_05 obj_03)
    (pred_5 obj_05)
    (pred_4 obj_06)
    (pred_3 obj_06 obj_14)
    (pred_4 obj_07)
    (pred_3 obj_07 obj_14)
    (pred_4 obj_08)
    (pred_3 obj_08 obj_14)
    (pred_2 obj_10 obj_11)
    (pred_2 obj_04 obj_14)
    (pred_2 obj_11 obj_13)
    (pred_2 obj_13 obj_03)
    (pred_2 obj_03 obj_04)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_07)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
