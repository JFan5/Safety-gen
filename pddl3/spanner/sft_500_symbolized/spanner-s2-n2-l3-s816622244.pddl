; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 816622244 --problem-name spanner-s2-n2-l3-s816622244
(define (problem spanner-s2-n2-l3-s816622244)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_05 obj_10 - type_5
     obj_07 obj_04 - type_4
     obj_02 obj_01 obj_06 - type_1
     obj_08 obj_09 - type_1
    )
 (:init 
    (pred_5 obj_03 obj_08)
    (pred_5 obj_05 obj_06)
    (pred_3 obj_05)
    (pred_5 obj_10 obj_06)
    (pred_3 obj_10)
    (pred_1 obj_07)
    (pred_5 obj_07 obj_09)
    (pred_1 obj_04)
    (pred_5 obj_04 obj_09)
    (pred_6 obj_08 obj_02)
    (pred_6 obj_06 obj_09)
    (pred_6 obj_02 obj_01)
    (pred_6 obj_01 obj_06)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_04))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_08)))
  )
)
)
