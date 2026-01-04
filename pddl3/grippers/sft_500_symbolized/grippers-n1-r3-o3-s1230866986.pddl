(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_03 obj_01 - type_3
obj_09 obj_08 obj_04 - type_2
obj_06 obj_02 obj_07 - object)
(:init
(pred_3 obj_05 obj_08)
(pred_1 obj_05 obj_03)
(pred_1 obj_05 obj_01)
(pred_4 obj_06 obj_09)
(pred_4 obj_02 obj_08)
(pred_4 obj_07 obj_08)
)
(:goal
(and
(pred_4 obj_06 obj_08)
(pred_4 obj_02 obj_09)
(pred_4 obj_07 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_05 ?b obj_01))))
)
)