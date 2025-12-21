(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_06 obj_10 - type_3
obj_08 obj_05 obj_07 obj_03 - type_2
obj_04 obj_01 obj_09 - object)
(:init
(pred_4 obj_02 obj_03)
(pred_2 obj_02 obj_06)
(pred_2 obj_02 obj_10)
(pred_3 obj_04 obj_07)
(pred_3 obj_01 obj_08)
(pred_3 obj_09 obj_05)
)
(:goal
(and
(pred_3 obj_04 obj_08)
(pred_3 obj_01 obj_08)
(pred_3 obj_09 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_02 ?b obj_10))))
)
)