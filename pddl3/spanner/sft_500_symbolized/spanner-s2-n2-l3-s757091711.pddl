; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 757091711 --problem-name spanner-s2-n2-l3-s757091711
(define (problem spanner-s2-n2-l3-s757091711)
 (:domain spanner)
 (:objects 
     obj_01 - type_3
     obj_04 obj_09 - type_1
     obj_08 obj_06 - type_4
     obj_02 obj_03 obj_07 - type_5
     obj_10 obj_05 - type_5
    )
 (:init 
    (pred_3 obj_01 obj_10)
    (pred_3 obj_04 obj_07)
    (pred_4 obj_04)
    (pred_3 obj_09 obj_02)
    (pred_4 obj_09)
    (pred_6 obj_08)
    (pred_3 obj_08 obj_05)
    (pred_6 obj_06)
    (pred_3 obj_06 obj_05)
    (pred_5 obj_10 obj_02)
    (pred_5 obj_07 obj_05)
    (pred_5 obj_02 obj_03)
    (pred_5 obj_03 obj_07)
)
 (:goal
  (and
   (pred_1 obj_08)
   (pred_1 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_08)) (not (pred_1 obj_06))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
