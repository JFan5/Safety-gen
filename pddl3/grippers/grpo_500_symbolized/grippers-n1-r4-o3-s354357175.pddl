(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_02 obj_05 - type_3
obj_01 obj_03 obj_07 obj_09 - type_2
obj_06 obj_04 obj_10 - object)
(:init
(pred_4 obj_08 obj_01)
(pred_2 obj_08 obj_02)
(pred_2 obj_08 obj_05)
(pred_3 obj_06 obj_09)
(pred_3 obj_04 obj_01)
(pred_3 obj_10 obj_01)
)
(:goal
(and
(pred_3 obj_06 obj_07)
(pred_3 obj_04 obj_09)
(pred_3 obj_10 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_08 ?b obj_02))))
)
)