(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_1
obj_09 obj_01 - type_2
obj_08 obj_02 obj_03 obj_07 - type_3
obj_10 obj_06 obj_05 - object)
(:init
(pred_3 obj_04 obj_08)
(pred_2 obj_04 obj_09)
(pred_2 obj_04 obj_01)
(pred_4 obj_10 obj_02)
(pred_4 obj_06 obj_08)
(pred_4 obj_05 obj_02)
)
(:goal
(and
(pred_4 obj_10 obj_03)
(pred_4 obj_06 obj_07)
(pred_4 obj_05 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_04 ?b obj_01))))
)
)