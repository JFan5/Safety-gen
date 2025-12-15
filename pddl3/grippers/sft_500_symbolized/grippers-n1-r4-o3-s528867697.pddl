(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_2
obj_07 obj_01 - type_1
obj_03 obj_09 obj_02 obj_05 - type_3
obj_06 obj_10 obj_04 - object)
(:init
(pred_1 obj_08 obj_02)
(pred_2 obj_08 obj_07)
(pred_2 obj_08 obj_01)
(pred_4 obj_06 obj_09)
(pred_4 obj_10 obj_09)
(pred_4 obj_04 obj_02)
)
(:goal
(and
(pred_4 obj_06 obj_03)
(pred_4 obj_10 obj_05)
(pred_4 obj_04 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_08 ?b obj_01))))
)
)