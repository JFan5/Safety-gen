(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_3
obj_01 obj_02 - type_2
obj_10 obj_07 obj_04 obj_08 - type_1
obj_09 obj_03 obj_06 - object)
(:init
(pred_2 obj_05 obj_04)
(pred_3 obj_05 obj_01)
(pred_3 obj_05 obj_02)
(pred_1 obj_09 obj_10)
(pred_1 obj_03 obj_10)
(pred_1 obj_06 obj_10)
)
(:goal
(and
(pred_1 obj_09 obj_10)
(pred_1 obj_03 obj_08)
(pred_1 obj_06 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_05 ?b obj_02))))
)
)