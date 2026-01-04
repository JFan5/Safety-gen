(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_08 - type_2
obj_05 obj_01 - type_3
obj_09 obj_07 obj_02 - type_1
obj_04 obj_06 obj_03 - object)
(:init
(pred_3 obj_08 obj_09)
(pred_1 obj_08 obj_05)
(pred_1 obj_08 obj_01)
(pred_2 obj_04 obj_07)
(pred_2 obj_06 obj_07)
(pred_2 obj_03 obj_02)
)
(:goal
(and
(pred_2 obj_04 obj_09)
(pred_2 obj_06 obj_09)
(pred_2 obj_03 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_08 ?b obj_01))))
)
)