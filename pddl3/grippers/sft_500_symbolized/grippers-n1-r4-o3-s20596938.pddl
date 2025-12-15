(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_3
obj_06 obj_10 - type_2
obj_05 obj_09 obj_08 obj_02 - type_1
obj_07 obj_01 obj_04 - object)
(:init
(pred_1 obj_03 obj_08)
(pred_3 obj_03 obj_06)
(pred_3 obj_03 obj_10)
(pred_4 obj_07 obj_05)
(pred_4 obj_01 obj_05)
(pred_4 obj_04 obj_08)
)
(:goal
(and
(pred_4 obj_07 obj_02)
(pred_4 obj_01 obj_02)
(pred_4 obj_04 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_03 ?b obj_10))))
)
)