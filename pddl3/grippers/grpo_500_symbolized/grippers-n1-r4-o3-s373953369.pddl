(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_1
obj_06 obj_02 - type_3
obj_10 obj_08 obj_05 obj_01 - type_2
obj_03 obj_09 obj_07 - object)
(:init
(pred_3 obj_04 obj_01)
(pred_4 obj_04 obj_06)
(pred_4 obj_04 obj_02)
(pred_2 obj_03 obj_08)
(pred_2 obj_09 obj_05)
(pred_2 obj_07 obj_08)
)
(:goal
(and
(pred_2 obj_03 obj_08)
(pred_2 obj_09 obj_08)
(pred_2 obj_07 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_04 ?b obj_02))))
)
)