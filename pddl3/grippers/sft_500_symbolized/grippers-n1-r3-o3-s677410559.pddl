(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_03 - type_2
obj_09 obj_01 - type_1
obj_04 obj_02 obj_07 - type_3
obj_06 obj_08 obj_05 - object)
(:init
(pred_4 obj_03 obj_04)
(pred_3 obj_03 obj_09)
(pred_3 obj_03 obj_01)
(pred_1 obj_06 obj_02)
(pred_1 obj_08 obj_02)
(pred_1 obj_05 obj_04)
)
(:goal
(and
(pred_1 obj_06 obj_02)
(pred_1 obj_08 obj_02)
(pred_1 obj_05 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_03 ?b obj_01))))
)
)