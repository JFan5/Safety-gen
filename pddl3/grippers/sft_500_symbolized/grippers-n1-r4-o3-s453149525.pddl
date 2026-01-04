(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_3
obj_09 obj_01 - type_2
obj_03 obj_02 obj_05 obj_08 - type_1
obj_04 obj_06 obj_10 - object)
(:init
(pred_1 obj_07 obj_05)
(pred_3 obj_07 obj_09)
(pred_3 obj_07 obj_01)
(pred_4 obj_04 obj_02)
(pred_4 obj_06 obj_03)
(pred_4 obj_10 obj_03)
)
(:goal
(and
(pred_4 obj_04 obj_03)
(pred_4 obj_06 obj_05)
(pred_4 obj_10 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_07 ?b obj_01))))
)
)