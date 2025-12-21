(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_02 obj_08 - type_2
obj_01 obj_03 obj_07 - type_3
obj_09 obj_04 obj_06 - object)
(:init
(pred_1 obj_05 obj_07)
(pred_3 obj_05 obj_02)
(pred_3 obj_05 obj_08)
(pred_2 obj_09 obj_01)
(pred_2 obj_04 obj_03)
(pred_2 obj_06 obj_03)
)
(:goal
(and
(pred_2 obj_09 obj_03)
(pred_2 obj_04 obj_03)
(pred_2 obj_06 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_05 ?b obj_08))))
)
)