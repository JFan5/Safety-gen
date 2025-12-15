(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_01 - type_2
obj_08 obj_03 obj_11 obj_04 - type_3
obj_06 obj_07 obj_10 - type_1
obj_12 obj_09 obj_02 - object)
(:init
(pred_3 obj_05 obj_06)
(pred_1 obj_05 obj_08)
(pred_1 obj_05 obj_03)
(pred_3 obj_01 obj_10)
(pred_1 obj_01 obj_11)
(pred_1 obj_01 obj_04)
(pred_2 obj_12 obj_07)
(pred_2 obj_09 obj_07)
(pred_2 obj_02 obj_07)
)
(:goal
(and
(pred_2 obj_12 obj_07)
(pred_2 obj_09 obj_10)
(pred_2 obj_02 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_05 obj_10) (pred_3 obj_01 obj_10))))
  )
)
)