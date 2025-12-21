; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1769317174 --problem-name spanner-s4-n3-l4-s1769317174
(define (problem spanner-s4-n3-l4-s1769317174)
 (:domain spanner)
 (:objects 
     obj_01 - type_3
     obj_11 obj_13 obj_09 obj_07 - type_5
     obj_02 obj_10 obj_05 - type_4
     obj_06 obj_14 obj_04 obj_08 - type_2
     obj_03 obj_12 - type_2
    )
 (:init 
    (pred_2 obj_01 obj_03)
    (pred_2 obj_11 obj_06)
    (pred_1 obj_11)
    (pred_2 obj_13 obj_06)
    (pred_1 obj_13)
    (pred_2 obj_09 obj_04)
    (pred_1 obj_09)
    (pred_2 obj_07 obj_04)
    (pred_1 obj_07)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_12)
    (pred_5 obj_10)
    (pred_2 obj_10 obj_12)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_12)
    (pred_6 obj_03 obj_06)
    (pred_6 obj_08 obj_12)
    (pred_6 obj_06 obj_14)
    (pred_6 obj_14 obj_04)
    (pred_6 obj_04 obj_08)
)
 (:goal
  (and
   (pred_3 obj_02)
   (pred_3 obj_10)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_02)) (not (pred_3 obj_10))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_03)))
  )
)
)
