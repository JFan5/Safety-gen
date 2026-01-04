(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_08 - type_3
obj_01 obj_12 obj_13 obj_06 - type_1
obj_07 obj_11 obj_10 obj_03 - type_2
obj_09 obj_04 obj_02 - object)
(:init
(pred_2 obj_05 obj_10)
(pred_3 obj_05 obj_01)
(pred_3 obj_05 obj_12)
(pred_2 obj_08 obj_11)
(pred_3 obj_08 obj_13)
(pred_3 obj_08 obj_06)
(pred_4 obj_09 obj_11)
(pred_4 obj_04 obj_10)
(pred_4 obj_02 obj_11)
)
(:goal
(and
(pred_4 obj_09 obj_10)
(pred_4 obj_04 obj_07)
(pred_4 obj_02 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_05 obj_10) (pred_2 obj_08 obj_10))))
  )
)
)