; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 397434166 --problem-name spanner-s4-n3-l4-s397434166
(define (problem spanner-s4-n3-l4-s397434166)
 (:domain spanner)
 (:objects 
     obj_14 - type_3
     obj_05 obj_11 obj_02 obj_09 - type_1
     obj_07 obj_12 obj_13 - type_4
     obj_01 obj_04 obj_10 obj_06 - type_2
     obj_03 obj_08 - type_2
    )
 (:init 
    (pred_5 obj_14 obj_03)
    (pred_5 obj_05 obj_01)
    (pred_3 obj_05)
    (pred_5 obj_11 obj_04)
    (pred_3 obj_11)
    (pred_5 obj_02 obj_10)
    (pred_3 obj_02)
    (pred_5 obj_09 obj_01)
    (pred_3 obj_09)
    (pred_6 obj_07)
    (pred_5 obj_07 obj_08)
    (pred_6 obj_12)
    (pred_5 obj_12 obj_08)
    (pred_6 obj_13)
    (pred_5 obj_13 obj_08)
    (pred_4 obj_03 obj_01)
    (pred_4 obj_06 obj_08)
    (pred_4 obj_01 obj_04)
    (pred_4 obj_04 obj_10)
    (pred_4 obj_10 obj_06)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_12)
   (pred_2 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_12))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_03)))
  )
)
)
